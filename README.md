# Swift-Package-Manager-docset
## Dash docset for SwiftPM docs from swift.org

## Install

The preferred method of installation is the User Contributed section of Dash's "Downloads" preferences. Alternatively, generate them yourself and then open swiftpm.docset with Dash (see below).

## Generate

Clone the repo and fetch the latest swift.org docs:

    git clone https://github.com/ThatsJustCheesy/Swift-Package-Manager-docset
    wget --recursive https://docs.swift.org/package-manager
    mv package-manager/* Swift-Package-Manager-docset/
    rmdir package-manager

Then run `build.sh`. If you don't already have the [`dashing`](https://github.com/technosophos/dashing) docset generator, the script prompts to install it for you using `brew`.

    cd Swift-Package-Manager-docset
    ./build.sh

This generates `swiftpm.docset`. Now you can add it to Dash, distribute it, whatever.

    # Add to dash
    open swiftpm.docset

## Style

The HTML table of contents provided by swift.org is used because it is more optimized for the presentation style.

## Bugs

When you find bugs, please report them as GitHub issues. Thanks!
