return {
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = os.getenv("HOME") .. "/.nvimsessions/",
	auto_session_enabled = true,
	auto_save_enabled = false,
	auto_restore_enabled = false,
	auto_session_suppress_dirs = nil,
	auto_session_use_git_branch = nil,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
}
