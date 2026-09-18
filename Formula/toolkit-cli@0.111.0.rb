class ToolkitCliAT01110 < Formula
  desc "phData Toolkit CLI - AI-powered tools for Data, ML, and Platform engineering"
  homepage "https://toolkit.phdata.io"
  url "https://repo.phdata.io/toolkit-cli/0.111.0/toolkit-cli-0.111.0.zip"
  sha256 "f2529917c43011b0ef9db6118c016ef1e47b3472b081f8b4dd05934b26268025"
  version "0.111.0"

  keg_only :versioned_formula

  depends_on "openjdk@25"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"toolkit"
    (bin/"toolkit").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="${JAVA_HOME:-#{Formula["openjdk@25"].opt_prefix}}"
      exec "#{libexec}/toolkit" "$@"
    EOS
    chmod 0755, bin/"toolkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/toolkit --version")
  end
end
