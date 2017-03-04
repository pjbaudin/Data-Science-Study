# Datacamp - Foundations of Inference

The process of making claims about  population based on information from a sample

**Vocabulary**

- Null hypothesis (Ho): the claim that is not interesting
- Alternative hypothesis (Ha): the claim corresponding to research hypothesis

The goal is to disprove the null hypothesis.

**Randomized distribution**

Logic of inference

Example:
Phat(west) - Phat(east)

Generating a distribution of the statistic from the null population gives information about whether the observed data are inconsistent with the null hypothesis.

Many random permutations lead to randomized distribution

# Example

Create a contingency table summarizing the data

table(disc)

Find proportion of each sex who were promoted

disc %>% group_by(sex) %>%
summarise(promoted_prop = mean(promote == "promoted"))

# Difference in proportion of promoted across sex grouped by gender
disc %>%
  rep_sample_n(size = nrow(disc), reps = 5) %>%
  mutate(prom_perm = sample(promote)) %>%
  group_by(replicate, sex) %>%
  summarize(prop_prom_perm = mean(prom_perm == "promoted"),
            prop_prom = mean(promote == "promoted"))  %>%
  summarize(diff_perm = diff(prop_prom_perm),
            diff_orig = diff(prop_prom))  # male - female


# Find the 0.90, 0.95, and 0.99 quantiles of diff_perm
disc_perm %>%
  summarize(q.90 = quantile(diff_perm, p = 0.90),
            q.95 = quantile(diff_perm, p = 0.95),
            q.99 = quantile(diff_perm, p = 0.99))

Definition of p-value
- Probability of observing data as or more extreme than what we actually got given that the null hypothesis is true.
