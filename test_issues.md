# MyST Syntax Test for Issues

This file tests the three main syntax highlighting issues that were reported.

## Issue 1: Cross-reference highlighting problem
Before fix: Text between {eq} roles was incorrectly highlighted as one unit
After fix: Each reference should be highlighted independently  

{eq}`aiy_rgk` and a wage rate $w(r)$ as given in {eq}`aiy_wgr`

Single reference: {ref}`my-target`

Multiple refs: {doc}`first` then {numref}`second` and {eq}`third`

## Issue 2: Math blocks with underscores 
Before fix: Underscores were highlighted as spelling errors (red)
After fix: Math content should not have spell checking

Inline math with underscores: $a_t + b_t = c_t$

Block math with underscores:
$$
a_{t+1} + c_t \leq w z_t + (1 + r) a_t
\quad
c_t \geq 0,
\quad \text{and} \quad  
a_t \geq -B
$$

## Issue 3: Standard markdown links
These should be properly highlighted by the base markdown syntax:

Standard link: [QuantEcon.py](https://quantecon.org/quantecon-py/)

Reference link: [Link text][ref-id]

[ref-id]: https://example.com

Autolink: <https://example.com>

## Other MyST features (should still work)
% This is a MyST comment

(target-name)=
### Target section

:::note
This is a directive
:::

```{warning}
Backtick directive
```

:math:`x^2 + y^2 = z^2`

+++