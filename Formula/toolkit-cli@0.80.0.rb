class ToolkitCliAT0800 < Formula
  desc "phData Toolkit CLI - AI-powered tools for Data, ML, and Platform engineering"
  homepage "https://toolkit.phdata.io"
  url "https://repo-dev.phdata.io/toolkit-cli/0.80.0/toolkit-cli-0.80.0.zip"
  sha256 "0c209c661a3942d389703d9b84f93d47a2502853433eef50afad3081693c9811"
  version "0.80.0"

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
