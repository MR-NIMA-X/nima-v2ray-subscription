# NIMA V2RAY — Subscription Portal

An ultra-cyberpunk, dark-pink custom subscription information template for **MHSanaei/3x-ui**.

## Visual identity

- Product name: **NIMA V2RAY**
- Brand credit: **Powered by Mr Nima**
- Ultra-dark interface with neon pink / purple accents
- Responsive glass panels and glowing cyberpunk details

## Features

- Traffic usage, upload, download and remaining data
- Subscription enabled state and online/offline indicator
- Expiry date and countdown
- Last-online time
- Copy subscription URL and individual connection links
- JSON and Clash/Mihomo profile shortcuts
- Optional announcement and support link
- Periodic refresh using 3x-ui's `?format=info` endpoint

## Requirements

- A 3x-ui version supporting custom subscription templates.
- Git installed on the server (the installer can install it on Debian/Ubuntu).

## Install

   ```bash
   bash <(curl -fsSL https://raw.githubusercontent.com/mr-nima-x/nima-v2ray-subscription/main/install.sh)
   ```

1.  In 3x-ui, open **Settings → Subscription → Information**.
2.  Set **Sub Theme Directory** to:

   ```text
   /etc/3x-ui/sub_templates/2-server
   ```

6. Save settings and open a subscription URL in a browser.

## Update

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/mr-nima-x/nima-v2ray-subscription/main/update.sh)
```

The updater backs up the existing template before replacing it.

## Uninstall

Download the repository and run:

```bash
sudo bash uninstall.sh
```

Then clear **Sub Theme Directory** in 3x-ui settings to restore the built-in page.

## Safety notes

- This project changes only the custom subscription HTML template.
- It does not modify Xray, inbounds, client settings, subscription IDs, Nginx, Cloudflare Tunnel, or public ports.
- Never commit real subscription URLs, UUIDs, client links, credentials, or server secrets.
- The template relies on Go `html/template` values provided by 3x-ui. Compatibility can vary by 3x-ui version.
- Traffic figures are subscription statistics returned by 3x-ui, not a live network-speed test.

## Credits

**NIMA V2RAY**  
Powered by **Mr Nima**
