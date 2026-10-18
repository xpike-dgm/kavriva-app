import { createRoot } from 'react-dom/client';
import { WorkspaceShell } from './workspace-shell';
import './workspace.css';

// No fixture session, browser role or local data can activate this entry point.
createRoot(document.getElementById('root')!).render(<WorkspaceShell />);
