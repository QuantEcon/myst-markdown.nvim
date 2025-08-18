# MyST Markdown Test File

This is a regular markdown paragraph.

% This is a MyST comment
% This is another comment

## MyST Features

### Block Breaks

Here's a block break:

+++

And another one:

+ + + +

### Targets

(my-target)=
## Referenced Section

You can reference the target above.

### Colon Fences

Here's a code block with colon fences:

:::python
def hello_world():
    print("Hello from MyST!")
:::

And a more complex one:

::::python
def complex_example():
    """
    This is a complex code example
    """
    x = [1, 2, 3]
    for i in x:
        print(i)
::::

### Directives

:::note
This is a note directive.
:::

:::warning
This is a warning directive with some content.

It can span multiple paragraphs.
:::

::::admonition My Custom Title
:class: tip

This is an admonition with a custom title and class.
::::

### Inline Roles

Here's some text with :ref:`my-target` and :doc:`another-reference`.

Also :math:`x^2 + y^2 = z^2` and :code:`print("hello")`.

### Math Expressions

Inline math: $\alpha + \beta = \gamma$ and display math:

$$
\int_0^\infty e^{-x} dx = 1
$$

### Cross References

See {ref}`my-target` and {doc}`some-document`.

You can also use {numref}`Figure %s <figure-label>`.