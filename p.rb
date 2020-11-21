require_relative File.join(__dir__, 'lib', 'os')

puts %i(
	windows? mac? linux?
	java?
	cpu_count open_file_command
	parse_os_release
	parse_lsb_release
	ipv4_private
	rss_bytes
	dev_null
	iron_ruby?

).map { |x| "#{x} => #{OS.send(x)}" }
