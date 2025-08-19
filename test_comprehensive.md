# MyST Syntax Highlighting Test

## Code-cell Directives

### Python
```{code-cell} python
def factorial(n):
    """Calculate factorial of n"""
    if n <= 1:
        return 1
    return n * factorial(n - 1)

# Test string formatting and keywords
numbers = [1, 2, 3, 4, 5]
for i in numbers:
    print(f"factorial({i}) = {factorial(i)}")
```

### JavaScript  
```{code-cell} javascript
function fibonacci(n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// Test arrow functions and template literals
const numbers = [1, 2, 3, 4, 5];
numbers.forEach(i => {
    console.log(`fibonacci(${i}) = ${fibonacci(i)}`);
});
```

### Julia
```{code-cell} julia
function prime_check(n::Int)
    if n < 2
        return false
    end
    for i in 2:sqrt(n)
        if n % i == 0
            return false
        end
    end
    return true
end

# Test Julia syntax features
println("Prime numbers up to 20:")
for i in 1:20
    if prime_check(i)
        println("$i is prime")
    end
end
```

## Math Directives and Roles

### Inline Math Role
The Pythagorean theorem: {math}`a^2 + b^2 = c^2`

### Block Math Directive
```{math}
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
```

### Complex Math
```{math}
\begin{aligned}
\nabla \times \vec{F} &= \left( \frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z} \right) \hat{i} \\
&\quad + \left( \frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x} \right) \hat{j} \\
&\quad + \left( \frac{\partial F_y}{\partial x} - \frac{\partial F_x}{\partial y} \right) \hat{k}
\end{aligned}
```

## Existing Features (Should Still Work)

### Regular Directives
```{note}
This is a note directive that should use regular highlighting.
```

```{warning}
This warning should not have language-specific highlighting.
```

### Standard Math
Inline: $x^2 + y^2 = z^2$

Block:
$$
\sum_{n=1}^{\infty} \frac{1}{n^2} = \frac{\pi^2}{6}
$$

### Other MyST Features
Cross-reference: {ref}`my-target`
Inline role: :math:`\alpha \beta`
Comment below:

% This is a MyST comment

(my-target)=
### Target Section

Block break:
+++
