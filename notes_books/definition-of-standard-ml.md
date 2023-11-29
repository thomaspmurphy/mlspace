# The Definition of Standard ML

## Structure
- Introduction
- Syntax of the Core
- Syntax of Modules
- Static Semantics for the Core
- State Semantics for Modules
- Dynamic Semantics for the Core
- Dynamic Semantics for Modules
- Programs
- Appendices
	- Derived forms
	- Full grammar
	- The Initial Static Basis
	- The Initial Dynamic Basis
	- Overloading
	- The Development of ML
	- What is New? (Revised Edition)
## Notes
### Preface
#### Standard ML
Standard ML is a functional language in the sense that the full power of mathematical functions are relevant. It has an advanced form of parametric modules for the organisation of large projects. It is strongly typed and was the first language to provide a type of polymorphic type which makes the strong typing remarkably flexible.

Semantic method.

'ML' stands for meta-language. This is a term used by logicians for a language in which other formal languages are discussed and analysed.

ML was originally conceived as a medium for finding and performing proofs in a logical language.

> Conducting rigorous argument as dialogue between person and machine has been a growing research topic throughout these twenty years.

computer-assisted reasoning

The principal of inferring useful structural information is also represented by the inference of signatures. Signatures describe the interfaces between modules. When the user combines modules, the signature discipline prevents him from mismatching their interfaces.
#### Language Definition
Every programming language has its own conceptual view of computation. This is usually indicated by the names used for the phrase classes of the language, or by its keywords: terms like package, module, structure, exception, channel, type, procedure, reference, sharing. These terms also have their abstract counterparts, which may be called *semantic objects*. It is these objects, not the syntax, which represent the conceptual view of each language; they are the character of the language.

They will loosely talk about these objects as *meanings*.

There are two major dimensions of language definition:
1. Creation of a world of meaning—a theory that draws all the elements of this language into its toils. It has to fall back upon mathematical notation to achieve this in order to avoid the paradox of defining one language in terms of another.[^1]
2. To construe a definition of *evaluation*. To define (at the very least) what meaning $M$ results from evaluating any phrase $P$ that is permitted in the language.

A **phrase** $P$ is never evaluated to a meaning in vacuo. Rather, it is always evaluated against a **background**. This background, $B$ is itself a semantic object, being a distillation of the meanings preserved from the evaluation of earlier phrases (typically variable declarations, procedural declarations, etc.).

So evaluation is background-dependent; $M$ depends on $B$ as well as $P$.

The keystone of this definition methodology is a certain kind of assertion about evaluation; it takes the form
$$
B \vdash P \implies M
$$
and may be pronounced:

*against the background $B$, the phrase $P$ evaluates to the meaning $M'$*.

The formal purpose of this definition is to ascertain which assertions of this form are true.

Another important requirement is being able to provide rules which allow assertions about a *compound* phrase $P$ to be inferred from assertions about its constituent phrases $P_1, \ldots, P_n$.

It is important to note that this is an *abstract evaluation*. That is, it does not invoke concrete data with an attached types, it just describes the behaviour of types themselves.

Interesting tangent to explore here on abstract machines and the potential risk of idealism in an description language untethered from the material realities of computation.

### 1 - Introduction

> ML is an interactive language. A program consists of a sequence of top-level declarations; the execution of each declaration modifies the top-level environment, which we call a **basis**, and reports the modification to the user.

There are three phases in the execution of a declaration: **parsing**, **elaboration** and **evaluation**.
- Parsing determines the grammatical form of a declaration.
- Elaboration, the static phase, determines whether it is well-typed and well-formed in other ways, and records relevant type  or form information in the basis.
- Evaluation, the dynamic phase, determines the value of the declaration and records relevant value information in the basis.

Corresponding to these phases, our formal definition divides into three parts: grammatical rules, elaboration rules and evaluation rules.

| Phase        | Description                                                                                                            | Rules                                                                               |
|--------------|------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Parsing      | Determines the grammatical form of a declaration.                                                                      | Grammatical rules                                                                   |
| Elaboration  | The static phase that determines whether it is well-typed and well-formed, recording relevant type or form information. | Elaboration rules                                                                   |
| Evaluation   | The dynamic phase that determines the value of the declaration, recording relevant value information.                  | Evaluation rules                                                                    |

Furthermore, the basis is divided into the static basis and the dynamic basis. For example, a variable which has been declared is associated with a type in the static basis and with a value in the dynamic basis

For the implementation, it is not necessary to divide the basis thus.

A lot of errors are discovered during elaboration, so it is beneficial to perform this phase separately. Elaboration without evaluation is part of what is normally called *compilation*: once a declaration (or larger entity) is compiled one wishes to evaluate it—repeatedly—without re-elaboration, from which it follows that it is useful to perform the evaluation phase separately.

ML consists of:
- A lower level language called the **Core language** (or **Core**);
- A middle level concerned with programming in the large called **Modules**;
- A very small upper level called **Programs**.

The Core provides many phrase classes, for programming convenience. But about half of these classes are derived forms, whose meaning can be given translation into the other half which we call the **Bare** language. Here the sections on the Core treat the Bare language; derived forms are treated in the appendix. The appendix also contains some derived forms for modules.

Semantics is presented in a form known as Natural Semantics. It consists of a set of rules allowing **sentences** of the form

$$
A \vdash \text{phrase} \implies A'
$$

to be inferred, where $A$ is often a basis (static or dynamic) and $A'$ a semantic object. In the static semantics this is often a type and in the dynamic semantics this is often a value.[^2]

> Against the background provided by $A$, the phrase $\text{phrase}$ elaborates—or evaluates—to the object $A'$.

### 2 - Syntax of the Core
## Reflections

---
# Notes

[^1]: Is this strictly what interpreted languages are doing? I.e. an implementation-defined scripting language which is compiled using C?
[^2]: Interesting order of progression from the more general to the particular here. The basis as most generally available scope. The type signatures in the static stage when it is elaborated. The concrete assumes values of data in the dynamic stage when it is evaluated.
