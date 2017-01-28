### Random sampling and random assignement

|      | Random assignment     | No random assignment| |
| :------------- | :------------- | :---- | | :----|
| **Random sampling**   | Causal and generalizable| Not causal but generalizable | **Generalizable** |
|**No random sampling**| Causal but not generalizable| Neither causal not generalizable| **Not generalizable**|
||**Causal** | **Not Causal**||

### Simpson's paradox

Explanatory and response variables

Multivariate relationships

[Wiki Simspson's paradox](https://en.wikipedia.org/wiki/Simpson's_paradox)

*Simpson's paradox, or the Yule–Simpson effect, is a paradox in probability and statistics, in which a trend appears in different groups of data but disappears or reverses when these groups are combined. It is sometimes given the descriptive title reversal paradox or amalgamation paradox.*

Difference between random sampling and stratified random sampling.

Stratified random sampling ensure an equal number of samples from each group.

**dplyr package**

sample_n for random sampling

### Principles of experimental design

1. **Control**: compare treatment of interest to a control group
2. **Randomize**: randomly assign subjects to treatments
3. **Replicate**: collect a sufficiently large sample within a study, or replicate the entire study
4. **Block**: account for the potential effect of confounding variables
      - Group subjects into blocks based on these variables
      - Randomize within each block to treatment groups
