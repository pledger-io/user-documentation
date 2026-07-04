---
title: The business domain of Pledger.io
type: docs
weight: 1
---
The diagram below depicts the domain model that is used in Pledger.io.
In this domain you can clearly see that the `Transaction` is linked to the `Account` using at least two `Parts`.
It also indicates that there are multiple concepts that describe the context of a transaction, these are:

- `Budget`
- `Category`
- `Tag`
- `Contract`

{{< image src="img/architecture/data-model.png" caption="Domain model" >}}

In this design the choice was made to attach everything on a `UserAccount`.
Where the `Account` is the primary entity, with an enumeration in it to indicate the type of account.
