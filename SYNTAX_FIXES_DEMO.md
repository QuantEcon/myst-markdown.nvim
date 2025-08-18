# MyST Syntax Highlighting Fixes - Demonstration

This file demonstrates the fixes for the three reported MyST syntax highlighting issues.

## Problem 1: Cross-reference Greedy Matching (FIXED ✅)

**Before:** The old pattern `syntax region mystCrossRef start="{\w\+}`" end="`"` would greedily match from the first `{` to the last `` ` `` on the line, highlighting everything between multiple cross-references.

**After:** New pattern `syntax match mystCrossRef "{\w\+}`[^`]*`"` matches each cross-reference individually.

**Test case:** {eq}`aiy_rgk` and a wage rate $w(r)$ as given in {eq}`aiy_wgr`

✅ Expected: Only the `{eq}`aiy_rgk`` and `{eq}`aiy_wgr`` parts should be highlighted, not the text in between.

## Problem 2: Math Block Underscore Highlighting (FIXED ✅)  

**Before:** Math blocks included `contains=@Spell` which caused underscores to be highlighted as spelling errors (red).

**After:** Removed `contains=@Spell` from math regions.

**Test case:**
$$
a_{t+1} + c_t \leq w z_t + (1 + r) a_t
\quad
c_t \geq 0,
\quad \text{and} \quad  
a_t \geq -B
$$

✅ Expected: Underscores should not show as red error highlights in math blocks.

## Problem 3: Standard Markdown Links (PRESERVED ✅)

**Issue:** Standard markdown link highlighting was not working properly.

**Solution:** Ensured our MyST patterns don't interfere with base markdown syntax.

**Test cases:**
- Standard link: [QuantEcon.py](https://quantecon.org/quantecon-py/)  
- Reference link: [Link text][ref-id]
- Autolink: <https://example.com>

[ref-id]: https://example.com

✅ Expected: All markdown link formats should be properly highlighted.

## Verification: Other MyST Features Still Work ✅

The fixes preserve all existing MyST functionality:

% MyST comment
(target)=
### Section with target

:::note
Directive with colon fences
:::

```{warning}
Directive with backticks  
```

Cross-ref: {ref}`target`
Inline role: :math:`x^2`
Block break below:

+++