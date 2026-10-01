-- T-E3-012 isolated adapter schema. NOT an applied hosted migration.
-- Only a separately provisioned trusted server role may read/write these tables.
CREATE SCHEMA IF NOT EXISTS kavriva_objects;
REVOKE ALL ON SCHEMA kavriva_objects FROM PUBLIC;
CREATE TABLE kavriva_objects.current_object (
    tenant_id text NOT NULL,
    object_id text NOT NULL,
    manifest jsonb NOT NULL,
    payload bytea NOT NULL,
    PRIMARY KEY (tenant_id, object_id)
);
CREATE TABLE kavriva_objects.current_validation (
    tenant_id text NOT NULL,
    object_id text NOT NULL,
    manifest_fingerprint text NOT NULL,
    policy_version text NOT NULL,
    required_checks jsonb NOT NULL CHECK (jsonb_typeof(required_checks) = 'array'),
    checks jsonb NOT NULL CHECK (jsonb_typeof(checks) = 'array'),
    PRIMARY KEY (tenant_id, object_id),
    FOREIGN KEY (tenant_id, object_id)
      REFERENCES kavriva_objects.current_object (tenant_id, object_id)
);
CREATE TABLE kavriva_objects.activation_receipt (
    tenant_id text NOT NULL,
    operation_id text NOT NULL,
    fingerprint text NOT NULL,
    object_id text NOT NULL,
    generation integer NOT NULL CHECK (generation > 0),
    manifest_fingerprint text NOT NULL,
    validation_policy_version text NOT NULL,
    validation_receipts jsonb NOT NULL,
    audit_receipt text NOT NULL,
    PRIMARY KEY (tenant_id, operation_id)
);
REVOKE ALL ON ALL TABLES IN SCHEMA kavriva_objects FROM PUBLIC;
CREATE FUNCTION kavriva_objects.protect_activation_receipt() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
    RAISE EXCEPTION 'activation receipts are append-only';
END;
$$;
REVOKE ALL ON FUNCTION kavriva_objects.protect_activation_receipt() FROM PUBLIC;
CREATE TRIGGER activation_receipt_append_only
BEFORE UPDATE OR DELETE ON kavriva_objects.activation_receipt
FOR EACH ROW EXECUTE FUNCTION kavriva_objects.protect_activation_receipt();
