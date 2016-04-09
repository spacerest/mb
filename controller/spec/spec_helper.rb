root = File.expand_path(File.dirname(__FILE__) + '/../')

lib = root + '/lib'
spec = root + '/spec'

$:.unshift(lib) unless $:.include?(lib)
$:.unshift(spec) unless $:.include?(spec)
