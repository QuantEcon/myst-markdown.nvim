# MyST Syntax Enhancement Test

This file contains examples of the syntax patterns we need to enhance.

## Code-cell directives that need language-specific highlighting

```{code-cell} python
def hello_world():
    print("Hello from Python!")
    x = [1, 2, 3]
    for i in x:
        print(f"Number: {i}")
```

```{code-cell} julia
function hello_world()
    println("Hello from Julia!")
    x = [1, 2, 3]
    for i in x
        println("Number: $i")
    end
end
```

```{code-cell} javascript
function helloWorld() {
    console.log("Hello from JavaScript!");
    const x = [1, 2, 3];
    x.forEach(i => console.log(`Number: ${i}`));
}
```

## Math directives that need LaTeX highlighting

```{math}
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
```

Inline math role: {math}`\alpha + \beta = \gamma`

More complex block math:
```{math}
\begin{aligned}
\frac{\partial u}{\partial t} &= \nabla^2 u \\
u(x,0) &= f(x) \\
\frac{\partial u}{\partial n}\bigg|_{\partial \Omega} &= 0
\end{aligned}
```

## Existing math (should continue to work)

Inline: $x^2 + y^2 = z^2$

Block:
$$
\sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}
$$

## Regular directives (should continue to work)

```{note}
This is a regular note directive without language highlighting.
```

:::warning
This is a warning directive.
:::