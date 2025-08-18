# myst-markdown.nvim

A Neovim extension for [MyST Markdown](https://mystmd.org) syntax highlighting.

## Features

This plugin provides syntax highlighting for MyST (Markedly Structured Text) markdown files, which extends CommonMark with powerful features for technical documentation.

**Supported MyST Features:**

- 📝 **Comments** - `% comment syntax`
- ➖ **Block breaks** - `+++` horizontal rules  
- 🎯 **Targets** - `(name)=` reference targets
- 📦 **Colon fences** - `:::language` code blocks
- 📋 **Directives** - `:::directive...:::`
- 🔗 **Inline roles** - `:role:`content``
- 📌 **Cross-references** - `{ref}`label``

All standard Markdown syntax is also supported, as MyST extends CommonMark.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'QuantEcon/myst-markdown.nvim',
  ft = { 'markdown', 'myst' },
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'QuantEcon/myst-markdown.nvim',
  ft = { 'markdown', 'myst' },
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'QuantEcon/myst-markdown.nvim'
```

## Usage

The plugin automatically activates for:

- Files with `.myst` extension
- Files with `.md` extension that contain MyST-specific syntax

No configuration is required - the plugin works out of the box with sensible defaults.

## MyST Syntax Examples

### Comments
```markdown
% This is a MyST comment
% Comments are not rendered in the output
```

### Directives
```markdown
:::note
This is a note directive.
:::

:::warning
This is a warning with content.
:::
```

### Targets and Cross-references
```markdown
(my-section)=
## My Section

Reference the section above with {ref}`my-section`.
```

### Code Blocks with Colon Fences
```markdown
:::python
def hello():
    print("Hello from MyST!")
:::
```

### Block Breaks
```markdown
Content above the break.

+++

Content below the break.
```

## Resources

- [MyST Markdown Documentation](https://mystmd.org)
- [MyST Syntax Guide](https://mystmd.org/spec)
- [MyST VS Code Extension](https://github.com/executablebooks/myst-vs-code) (inspiration for this plugin)

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

MIT License - see [LICENSE](LICENSE) for details.
