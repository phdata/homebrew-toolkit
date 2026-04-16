class ToolkitCli < Formula
  desc "phData Toolkit CLI - AI-powered tools for Data, ML, and Platform engineering"
  homepage "https://toolkit.phdata.io"
  url "https://repo-dev.phdata.io/toolkit-cli/maven/io/phdata/toolkit/toolkit-cli/0.94.1/toolkit-cli-0.94.1.zip"
  sha256 "8588623bbb0e4a23ff28fe936bb988d827af99d29176770fc9b9cdb5fb85d4be"
  version "0.94.1"

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
