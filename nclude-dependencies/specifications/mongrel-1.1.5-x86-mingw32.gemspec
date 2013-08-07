# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongrel"
  s.version = "1.1.5"
  s.platform = "x86-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zed A. Shaw"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDUDCCAjigAwIBAgIBADANBgkqhkiG9w0BAQUFADBOMRwwGgYDVQQDDBNtb25n\ncmVsLWRldmVsb3BtZW50MRkwFwYKCZImiZPyLGQBGRYJcnVieWZvcmdlMRMwEQYK\nCZImiZPyLGQBGRYDb3JnMB4XDTA3MDkxNjEwMzI0OVoXDTA4MDkxNTEwMzI0OVow\nTjEcMBoGA1UEAwwTbW9uZ3JlbC1kZXZlbG9wbWVudDEZMBcGCgmSJomT8ixkARkW\nCXJ1Ynlmb3JnZTETMBEGCgmSJomT8ixkARkWA29yZzCCASIwDQYJKoZIhvcNAQEB\nBQADggEPADCCAQoCggEBAMb9v3B01eOHk3FyypbQgKXzJplUE5P6dXoG+xpPm0Lv\nP7BQmeMncOwqQ7zXpVQU+lTpXtQFTsOE3vL7KnhQFJKGvUAkbh24VFyopu1I0yqF\nmGu4nRqNXGXVj8TvLSj4S1WpSRLAa0acLPNyKhGmoV9+crqQypSjM6XKjBeppifo\n4eBmWGjiJEYMIJBvJZPJ4rAVDDA8C6CM1m3gMBGNh8ELDhU8HI9AP3dMIkTI2Wx9\n9xkJwHdroAaS0IFFtYChrwee4FbCF1FHDgoTosMwa47DrLHg4hZ6ojaKwK5QVWEV\nXGb6ju5UqpktnSWF2W+Lvl/K0tI42OH2CAhebT1gEVUCAwEAAaM5MDcwCQYDVR0T\nBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0OBBYEFGHChyMSZ16u9WOzKhgJSQ9lqDc5\nMA0GCSqGSIb3DQEBBQUAA4IBAQA/lfeN2WdB1xN+82tT7vNS4HOjRQw6MUh5yktu\nGQjaGqm0UB+aX0Z9y0B0qpfv9rj7nmIvEGiwBmDepNWYCGuW15JyqpN7QVVnG2xS\nMrame7VqgjM7A+VGDD5In5LtWbM/CHAATvvFlQ5Ph13YE1EdnVbZ65c+KQv+5sFY\nQ+zEop74d878uaC/SAHHXS46TiXneocaLSYw1CEZs/MAIy+9c4Q5ESbGpgnfg1Ad\n6lwl7k3hsNHO/+tZzx4HJtOXDI1yAl3+q6T9J0yI3z97EinwvAKhS1eyOI2Y5eeT\ntbQaNYkU127B3l/VNpd8fQm3Jkl/PqCCmDBQjUszFrJEODug\n-----END CERTIFICATE-----\n", "-----BEGIN CERTIFICATE-----\nMIIDQzCCAiugAwIBAgIBADANBgkqhkiG9w0BAQUFADBOMRwwGgYDVQQDDBNtb25n\ncmVsLWRldmVsb3BtZW50MRkwFwYKCZImiZPyLGQBGRYJcnVieWZvcmdlMRMwEQYK\nCZImiZPyLGQBGRYDb3JnMB4XDTA3MDkyNDAyMzAzOVoXDTA4MDkyMzAyMzAzOVow\nQTETMBEGA1UEAwwKbHVpc2xhdmVuYTEVMBMGCgmSJomT8ixkARkWBWdtYWlsMRMw\nEQYKCZImiZPyLGQBGRYDY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC\nAQEA5gIWDL7FYk43BEM3guuNz1vrr2RW7UAh+KY8w2+cGxt+MNi3P+rrfx/LAr7d\nKKV+RT7PQgutb9MZhk8ghn0qgTpCxWbvlhnFrMqIDaJy9nXGEWt6M0fTWdEojrzF\ndLSO//3GYzZze/ykE20KeNZ8SXzbxPwmIwrKfvoGYshGdmU7RAwiV6vV9ZS4uB1I\n/pvzsWp3cSqZwxJvtb7P445jcDMPqFXjMFVAXd6KpfVNl4ZNBzYHc0Ii2uLu3Pv4\njOmwvJlYZ30ccBh0G86ngtlOpZNrdcnXgRKXADGnxPickYZMdIHPPykIeR6Im0sR\nhCq6hsHkuWQU6CuwqTtGErw6uwIDAQABozkwNzAJBgNVHRMEAjAAMAsGA1UdDwQE\nAwIEsDAdBgNVHQ4EFgQUkz5QYICmPVaUs8rhPOQmhrDosCUwDQYJKoZIhvcNAQEF\nBQADggEBAMVgi+dtUNn1WNgsrkDi8wPkBbTj4qvTdu/mLncUD/wSNEfaf0ADiycu\nW9x8imY3UmSyyc2HO+/Wnf6/PkbaoAcUZxl/7a60UDqSyTpdpfB3moA7z9+j+Kyp\nnVFr7JVQG3SSNC/y0XrYf6J0DCgpLwOqLSes/KaQOtJlXl/xV37AHXEnAPjwJyCD\nqafzGwoObqIf7Vj8IzU/eoCx/SxAYnaevry1bls58eb28FKGuq7bWyJuDrFu1H8m\nmPG0Kv6rJ8vKyQiYZMAKm+XpuDZ09rnGm3ytdeEpXDfF5osSDDBSlWox82z2ulMd\nknPjAuGZt50yNl1teBnVEZkty2RINfo=\n-----END CERTIFICATE-----\n"]
  s.date = "2008-08-15"
  s.description = "A small fast HTTP library and server that runs Rails, Camping, Nitro and Iowa apps."
  s.email = ""
  s.executables = ["mongrel_rails"]
  s.files = ["bin/mongrel_rails"]
  s.homepage = "http://mongrel.rubyforge.org"
  s.require_paths = ["lib", "ext"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.4")
  s.rubyforge_project = "mongrel"
  s.rubygems_version = "1.8.15"
  s.summary = "A small fast HTTP library and server that runs Rails, Camping, Nitro and Iowa apps."

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gem_plugin>, [">= 0.2.3"])
      s.add_runtime_dependency(%q<cgi_multipart_eof_fix>, [">= 2.4"])
    else
      s.add_dependency(%q<gem_plugin>, [">= 0.2.3"])
      s.add_dependency(%q<cgi_multipart_eof_fix>, [">= 2.4"])
    end
  else
    s.add_dependency(%q<gem_plugin>, [">= 0.2.3"])
    s.add_dependency(%q<cgi_multipart_eof_fix>, [">= 2.4"])
  end
end
