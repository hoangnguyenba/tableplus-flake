# 🐧 TablePlus Flake (Linux)

A simple [Nix flake](https://nixos.wiki/wiki/Flakes) to install and run [TablePlus](https://tableplus.com/) (Linux AppImage) via `appimage-run`.

No need to manually download or manage the AppImage — Nix handles it for you.

---

## 🚀 Usage

### Run locally

```bash
nix run github:hoangnguyenba/tableplus-flake
```

Or if you're working locally:

```bash
nix run path:/path/to/this/repo
```

---

## 📦 Add to your own flake

In your `flake.nix`:

```nix
{
  inputs.tableplus.url = "github:hoangnguyenba/tableplus-flake";

  outputs = { self, nixpkgs, tableplus, ... }: {
    homeConfigurations.yourUser = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      modules = [
        {
          home.packages = [
            tableplus.packages.x86_64-linux.default
          ];
        }
      ];
    };
  };
}
```

---

## 🛠 Notes

- This wrapper uses [`appimage-run`](https://github.com/probonopd/go-appimage) to launch the TablePlus AppImage.
- The AppImage is fetched from:  
  `https://tableplus.com/release/linux/x64/TablePlus-x64.AppImage`

---

## ✅ To Do

- [ ] Automatically check for updates to the AppImage
- [ ] Add platform support for other architectures (if TablePlus supports it)

---

## 📄 License

This flake only wraps an external binary. All rights belong to TablePlus.  
This project is MIT-licensed.
