# Reproducible Research

## Week 3 - Course Notes

### Communicating Results

Specify the level of detail

It is often useful to breakdown the results of an analysis into different levels of granularity / detail

**Hierarchy of information: Research Paper**

- title / author list
- abstract
- body / results
- supplementary materials (the gory details)
- code / data (really gory details)

**Hierarchy of information: Email presentation**

- subject line / sender info
    - can you summarize findings in one sentence?
- Email body
    - a brief introduction of the problem / context
    - suggest some options and solutions if action is needed
    - try to make answer to questions yes/no
- Attachment
- Links to supplementary materials

Different people will be interested in different level of details

### Rpubs

[rpubs.com](rpubs.com)

Needs to register an account before using

Can share this publicly, not private information

### Reproducible Research - Checklist

1. Start with Good Science
      - Garbage in - garbage out
      - coherent, focused question simplifies many problems
      - working with good collaborators reinforces good practices
      - something that is interesting to you will (hopefully) motivate good habits

2. Don't do things by hand
      - Editing spreadsheets of data to "clean it up"
        - removing outliers
        - QA / QC
        - Validating
      - Editing tables or figures
      - Downloading data from a website
      - Moving data around your computer, splitting/reformating data files
      -
Things done by hand need to be precisely documented

3. Don't point and click
      - Many data processing / statistical analysis packages have graphical user interfaces
      - GUIs are convenient / intuitive but the actions you take with a GUI can be difficult for others to reproduce
      - Some GUIs produce a log file or script which includes equivalent commands, these can be saved for later examination
      - In general, be careful with data analysis software that is highly interactive; ease of use can sometimes lead to non-reproducible research
      - Other interactive software, such as text editors are usually fine

4. Teach a Computer to do it
      - if something needs to be done as part of your analysis / investigation, try to teach your computer to do it
      - in order to give your computer instruction, you need to write down exactly what you mean to do and how it should be done
      - Teaching a computer almost guarantees reproducibility

5. Use some version control
      - Slow things down
      - Add changes in small chunks
      - Track / tag snapshots, revert to old versions

6. Keep track of your software environment
      - If you work on a complex project involving many tools / datasets, the software and computing environment can be critical for reproducing your analysis
      - Computer architecture
      - Operating System
      - Software toolchain
      - Supporting software / infrastructure
      - External dependencies
      - Version numbers

7. Don't save output
      - Avoid saving data analysis output (tables, figures, summaries, processed data, etc.), except perhaps temporarily for efficiency purposes
      - If a stray output file cannot be easily connected with the means by which it was created, then it is not reproducible
      - Save the date and code that generated the output rather than the output itself
      - Intermediate files are okay as long as there is clear documnentation of how they were created

8. Set your seed
      - Random number generators generate pseudo-random numbers based on an initial seed (usually a number or a set of numbers)
      - In R you can use the set.seed() function to set the see and to specify the random number generator to use
      - Setting the seed allows for the stream of random numbers to be exactly reproducible
      - Whenever you generate random numbers for a non-trivial purpose, always set the seed

9. Do think about the entire pipeline
      - Data analsysis is a lengthy process, it is not just tables / figures / reports
      - Raw data -> processed data -> analysis -> report
      - How you got to the end is just as important as the end itself
      - The more of the data analysis pipeline you can make reproducible, the better for everyone

**Summary - Checklist**

- Are we doing good science?
- Was any part of this analysis done by hand?
      - If so, are those parts *precisely* documented?
      - Does the documentation match reality?
- Have we tought a computer to do as much as possible?
- Are we using a version control system?
- Have we documented our software environment?
- Have we saved any output that we cannot reconstruct from original data and code?
- How far back in the analysis pipeline can we go before our results are no longer (automatically) reproducible?


### Evidence-base Data

#### Replication

- Focuses on the validity of the scientific claim
- "Is this claim true?"
- The ultimate standard for strenghtening scientific evidence
- New investigators, data, analytical methods, laboratories, instruments, etc.
- Particularly important in studies that can impact broad policy or regulatory decisions

#### Reproducibility

- Focuses on the validity of the data analysis
- "Can we trust this analysis?"
- Arguably a minimum standard for any scientific study
- New investigators, same data, same methods
- Important when replication is impossible


**What problem does reproducibility solve?**

- Transparency
- Data availability
- Software / Methods Availability
- Improved transfer of knowledge

We don't get validity / correctness of the analysis with just reproducibility.

An analysis can be reproducible and still be wrong.

We want to know "can we trust this analysis?"

Does requiring reproducibility deter bad analysis?


**Problems with reproducibility**

The premise of reproducible research is that with code/data available, people can check each other and the whole system is self-correcting.

- Addresses the most "downstream" aspect of the research process (post publication).
- Assmes everyone plays by the same rules and wants to achieve the same goals (i.e. scientific discovery)


#### Who reproduces research?

- For reproducibility to be effective as a means to check validity, someone needs to do something:
      - Re-run the analysis, checkthe results match
      - Check the code for bugs/errors
      - Try alternate approaches, check sensitivity
- The need for someone to do something is inherited from traditional notion of replication
- Who is "someone" and what are their goals?

#### Evidence-based Data Analysis

- Most data analysis involve stringing together many different tools and methods
- Some methods may be standard for a given field, but others are often applied ad hoc
- We should apply thoroughly studied (via statistical research) mutually agreed upon methods to analyze data whenever possible
- There should be evidence to justify the application of a given method

- Create analytic pipelines from evidence-based components (standardize it)
- A Determinitic Statistical Machine
- Once an evidence-based analytic pipeline is established, we shouldn't mess with it
- Analysis with "transparent box"
- Reduce the "researcher degrees of freedom"
- Analogou to a pre-specified clinical trial protocol

### Summary

- Reproducible research is important, but does not necessarily solve the critical question of whether a data analysis is trustworthy.
- Reproducible research focuses on the most "downstream" aspect of research dissemination
- Evidence-based data analysis would provide standardized, best practices for given scientific areas and questions
- Gives reviewers an important tool without dramatically increasing the burden on them
- More effort should be put into improving the quality of "upstream" aspects of scientific research
