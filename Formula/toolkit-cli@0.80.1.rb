class ToolkitCliAT0801 < Formula
  desc "phData Toolkit CLI - AI-powered tools for Data, ML, and Platform engineering"
  homepage "https://toolkit.phdata.io"
  url "https://repo-dev.phdata.io/toolkit-cli/0.80.1/toolkit-cli-0.80.1.zip"
  sha256 "09a232cc9944adc8af82703d877e8c258a0e690e65c084acb07e4b7651f4f91a"
  version "0.80.1"

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
