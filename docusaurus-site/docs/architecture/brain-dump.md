---
title: Brain Dump
sidebar_position: 3
---

# Brain Dump

Pepay allows for user inventory management for payments with its integration of non-custodial wallets.

## Key Concepts

### Tabs Implementation

Each tab functions as a mini page that can contain multiple blocks of any type. This allows for organizing related content including:
- Code blocks
- Images
- Integration blocks
- Multiple content types within individual tabs

#### Example: JavaScript Implementation

```javascript
const handleFetchEvent = async (request, context) => {
    return new Response({message: "Hello World"});
};
```

### Expandable Sections

Expandable blocks are helpful for:
- Condensing lengthy paragraphs
- Creating step-by-step guides
- Building FAQ sections

<details>
<summary>Click to expand for more details</summary>

Expandable blocks are helpful in condensing what could otherwise be a lengthy paragraph. They are also great in step-by-step guides and FAQs.

</details>

### Visual Documentation

Visual elements can enhance documentation through:
- Diagrams and drawings
- Embedded content
- Interactive demonstrations

### Embedded Content Support

The documentation system supports thousands of embedded websites out-of-the-box, simply by pasting their links. This includes:
- Video content
- Interactive demos
- External documentation references

:::info
For a complete list of supported embedded content, check [iframely.com](https://iframely.com) for natively supported integrations.
:::