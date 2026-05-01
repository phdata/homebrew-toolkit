class ToolkitCliAT0811 < Formula
  desc "phData Toolkit CLI - AI-powered tools for Data, ML, and Platform engineering"
  homepage "https://toolkit.phdata.io"
  url "https://repo.phdata.io/toolkit-cli/0.81.1/toolkit-cli-0.81.1.zip"
  sha256 "16418a2edba8733963cf2a30a6a7c0b55958ee3958190a5ea8840ad358a4b1e8"
  version "0.81.1"

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
