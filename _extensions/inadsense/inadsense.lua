function inadsense(args, kwargs, meta)
    -- Get Adsense Credentials
    local adclient = pandoc.utils.stringify(meta['adsense.client'])
    local inArticleSlot = pandoc.utils.stringify(meta['adsense.slot'])

    -- Load Google in-article Adsense script
    local adscript = '<script async type="text/plain" cookie-consent="targeting" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>'
        ..
        '<ins class="adsbygoogle" style="display:block; text-align:center;" data-ad-layout="in-article" data-ad-format="fluid" '
        .. 'data-ad-client="'
        .. adclient
        .. '" data-ad-slot="'
        .. inArticleSlot
        .. '"></ins> '

    -- Write "Advertisement" at bottom of the ad
    local adnotice = '<script type="text/plain" cookie-consent="targeting">(adsbygoogle = window.adsbygoogle || []).push({});</script>\n'
        .. '<center><div class="adtext"></div></center>\n'
        .. '<script type="text/plain" cookie-consent="targeting">'
        .. 'var elems = document.getElementsByClassName("adtext");\n'
        .. 'for(var i = 0; i < elems.length; i++) { elems[i].innerHTML = "<p>Advertisement</p>"; }\n</script>\n'

    -- Combine into one block
    local advert = adscript .. adnotice

    if quarto.doc.isFormat('html') then
        return pandoc.RawBlock('html', advert)
    else
        return pandoc.Null()
    end
end
