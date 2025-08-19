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
- 💻 **Code-cell directives** - ```{code-cell} language` with syntax highlighting
- 🔗 **Inline roles** - `:role:`content``
- 📌 **Cross-references** - `{ref}`label``
- ➕ **Math expressions** - `$inline$` and `$$block$$` math
- 🧮 **Math directives** - ```{math}` with LaTeX highlighting

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
- Files where you manually run `:MystMarkdown` or `:SetMyst`

### For .myst files

Simply open any `.myst` file and the syntax highlighting will be activated automatically.

### For .md files with MyST content

When working with `.md` files that contain MyST syntax, you can manually activate MyST highlighting:

```vim
:MystMarkdown
```

or

```vim
:SetMyst
```

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

### Code-cell Directives (Enhanced)
Code-cell directives now support language-specific syntax highlighting:

```markdown
```{code-cell} python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(f"fibonacci(10) = {fibonacci(10)}")
```

```{code-cell} julia
function fibonacci(n::Int)
    if n <= 1
        return n
    end
    return fibonacci(n-1) + fibonacci(n-2)
end

println("fibonacci(10) = $(fibonacci(10))")
```

```{code-cell} javascript
function fibonacci(n) {
    if (n <= 1) return n;
    return fibonacci(n-1) + fibonacci(n-2);
}

console.log(`fibonacci(10) = ${fibonacci(10)}`);
```
```

Supported languages: python, python3, py, julia, jl, javascript, js, r, bash, sh, sql, ruby, go, rust, cpp, c, java

### Block Breaks
```markdown
Content above the break.

+++

Content below the break.
```

### Math Expressions
```markdown
Inline math: $x^2 + y^2 = z^2$

Block math:
$$
\int_0^1 x dx = \frac{1}{2}
$$

Math directive (Enhanced):
```{math}
\begin{aligned}
\nabla \times \vec{F} &= \left( \frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z} \right) \hat{i} \\
&\quad + \left( \frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x} \right) \hat{j}
\end{aligned}
```

Inline math role: {math}`\alpha + \beta = \gamma`
```

## Resources

- [MyST Markdown Documentation](https://mystmd.org)
- [MyST Syntax Guide](https://mystmd.org/spec)
- [MyST VS Code Extension](https://github.com/executablebooks/myst-vs-code) (inspiration for this plugin)

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## License

MIT License - see [LICENSE](LICENSE) for details.
