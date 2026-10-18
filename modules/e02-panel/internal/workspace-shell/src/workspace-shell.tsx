/** Layout only. E3/E5 have not supplied an authorized workspace binding. */
export function WorkspaceShell() {
  return (
    <>
      <a className="skip-link" href="#workspace">İçeriğe geç</a>
      <header className="workspace-header">
        <div>
          <p className="brand">Kavriva</p>
          <h1>Yönetim çalışma alanı</h1>
        </div>
        <p className="connection-label">Bağlantı doğrulanmadı</p>
      </header>

      <section className="access-notice" aria-labelledby="access-title">
        <h2 id="access-title">Çalışma alanı henüz kullanıma açılmadı</h2>
        <p>Bu ekran kayıt sistemine bağlı değil. Özel kayıtlar ve işlemler kapalıdır.</p>
        <a href="#help">Durum açıklamasına git</a>
      </section>

      <div className="workspace-layout">
        <nav className="workspace-navigation" aria-label="Çalışma alanı bölümleri">
          <h2>Bölümler</h2>
          <a href="#work-list">Çalışma listesi</a>
          <a href="#record-context">Kayıt bağlamı</a>
          <a href="#activity">İşlem durumu</a>
          <a href="#help">Destek</a>
        </nav>

        <main id="workspace" tabIndex={-1} aria-label="Çalışma alanı">
          <div className="workspace-summary" role="status">
            Güncel bağlantı ve erişim doğrulanmadı. İzinli bir kayıt gösterilmiyor.
          </div>
          <div className="workspace-panels">
            <section id="work-list" className="workspace-panel work-list" tabIndex={-1} aria-labelledby="work-list-title">
              <h2 id="work-list-title">Çalışma listesi</h2>
              <p className="panel-state">Listeye erişim doğrulanmadı</p>
              <p>Kayıtlar yüklenmedi. Bu görünüm, iş listesinin boş veya işlerin tamamlanmış olduğu anlamına gelmez.</p>
              <p>İzinli bağlantı kurulmadan inceleme veya onay başlatılamaz.</p>
            </section>

            <section id="record-context" className="workspace-panel" tabIndex={-1} aria-labelledby="record-context-title">
              <h2 id="record-context-title">Kayıt bağlamı</h2>
              <p className="panel-state">İzinli kayıt açılmadı</p>
              <p>Seçili kayıt, motosiklet kapsamı, sürüm ve kaynak bilgisi henüz doğrulanmadı.</p>
            </section>

            <section id="activity" className="workspace-panel" tabIndex={-1} aria-labelledby="activity-title">
              <h2 id="activity-title">İşlem durumu</h2>
              <p className="panel-state">Bu ekrandan işlem başlatılmadı</p>
              <p>Kayıt değiştirme, onay ve yayın işlemleri şu anda kullanılamıyor.</p>
            </section>
          </div>
        </main>
      </div>

      <footer id="help" tabIndex={-1} aria-labelledby="help-title">
        <h2 id="help-title">Destek ve durum açıklaması</h2>
        <p>Bu çalışma alanı henüz kayıt erişimine açılmadı. Şu anda özel kayıt açamaz veya işlem yapamazsınız.</p>
        <p>İşlem yapmadan bu sayfadan ayrılabilirsiniz. Kayıtlar ve izinler bu ekrandan değiştirilemez.</p>
      </footer>
    </>
  );
}
