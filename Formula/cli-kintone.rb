# ref. https://docs.brew.sh/Formula-Cookbook
# ref. https://docs.brew.sh/Node-for-Formula-Authors
# ref. https://rubydoc.brew.sh/Formula
class CliKintone < Formula
  desc "CLI tool to import/export records to/from kintone"
  homepage "https://cli.kintone.dev/"
  # https://docs.brew.sh/Node-for-Formula-Authors#download-url
  url "https://registry.npmjs.org/@kintone/cli/-/cli-1.14.2.tgz"
  sha256 "637f7117a9a8782d7430381d47f846d38217f6ef5a3127bd1cc6032309dc4d8c"
  license "MIT"

  # https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://registry.npmjs.org/@kintone/cli/latest"
    strategy :json do |json|
      json["version"]
    end
  end

  # https://docs.brew.sh/Node-for-Formula-Authors#dependencies
  depends_on "node" => [:build, :test]

  def install
    # https://docs.brew.sh/Node-for-Formula-Authors
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]

    # https://cli.kintone.dev/guide/installation/#command-completion
    generate_completions_from_executable(bin/"cli-kintone", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cli-kintone --version")
  end
end
