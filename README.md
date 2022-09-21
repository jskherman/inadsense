# Google Adsense Extension for Quarto

This extension provides [shortcode](https://quarto.org/docs/extensions/shortcodes.html) support for including ad units into Quarto html documents on a website or blog.

## Installing

```sh
quarto install extension jskherman/inadsense
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Usage

It is required that you need to specify `cookie-consent` and Google Adsense credentials in `_quarto.yml` first before you can insert ad units.

Example: 
```yaml
website:
  cookie-consent:
    type: express # or implied

adsense:
    client: "ca-pub-xxxxxxxxxxxxxxxx"   # data-ad-client
    slot:   "1234567890"                # data-ad-slot
```

You can get your credentials by signing up for a [Google Adsense account](https://www.google.com/adsense/start/), going to the `Ads` option on the left sidebar and creating a new in-article ad. For more information please refer to how this was achieved via Hugo by at godo.dev: [Inserting an Ad Unit to Hugo Content without Shortcode](https://www.godo.dev/tutorials/hugo-in-article-ad/)

![Google Adsense](/assets/adsense.png)

After that, you can then use the shortcode `{{< inadsense >}}` in your `qmd` files to embed ad units in pages.

## Example

```markdown
**Hi world**! *Below* this text you can find an ad by replacing it with a javascript `<script>` block.

{{< inadsense >}}

Above this line is an ad, with a label under it that says "Advertisement". Nothing will show up yet because you need to accept the cookie consent for ads and targeting cookies first.
```

Here is also an example of the shortcode used in a website.
- [Quarto Document](/example.qmd)
- [Quarto HTML Output](https://jskherman.quarto.pub/inadsense-extension-website/)

## Limitations

- Uses only in-article ad units of Google Adsense
- Only supports `html` format in Quarto websites or blogs.

Note: The format must be `html` and a website because this only makes sense for that context (duh ;P).