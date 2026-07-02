cask "pipes-local" do
  version "0.4.6"
  sha256 "a3829bd1663c5693936e9f5df3c38e5fff499066231176fe7591d56db8563fef"

  github_token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")

  url "https://api.github.com/repos/dyegovasc/homebrew-pipes/releases/assets/464365392",
      verified: "api.github.com/",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{github_token}",
        "X-GitHub-Api-Version: 2022-11-28",
      ]

  name "Pipes Local"
  desc "Local-first structured markdown workspace application"
  homepage "https://github.com/dyegovasc/homebrew-pipes"

  depends_on arch: :arm64

  app "Pipes Local.app"

  caveats <<~EOS
    Installing Pipes Local from this private tap requires HOMEBREW_GITHUB_API_TOKEN
    with read access to the private GitHub Release asset.
  EOS

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pipes Local.app"],
                   sudo: false
  end

  uninstall quit: "com.pipes.local"
end
