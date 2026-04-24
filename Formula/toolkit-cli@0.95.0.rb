class ToolkitCliAT0950 < Formula
  desc "phData Toolkit CLI - AI-powered tools for Data, ML, and Platform engineering"
  homepage "https://toolkit.phdata.io"
  url "https://repo-dev.phdata.io/toolkit-cli/0.95.0/toolkit-cli-0.95.0.zip"
  sha256 "3faf9f9bd3bdc88d3601aad8b54e4801324912a310ecb3c3fd206356f5d25027"
  version "0.95.0"

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
