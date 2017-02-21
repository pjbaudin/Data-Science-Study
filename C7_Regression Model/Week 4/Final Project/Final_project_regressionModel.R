# Regression Model - Final Project

par(mfcol = c(1,2))
plot(resid(mpgam_model_step) ~ predict(mpgam_model_step))

qqnorm(rstudent(mpgam_model_step))
qqline(rstudent(mpgam_model_step), colour = "blue", lwd = 2)


ggplot(mtcars) +
        stat_qq(aes(sample = mpg, colour = factor(cyl)))

summary(mpgam_model_step)

par(mfrow = c(2, 2))
plot(mpgam_model_step)

par(mfrow = c(2, 2))
plot(mpgam_model)

par(mfrow = c(2, 2))
plot(mpgam_model_final)

par(mfrow = c(2, 2))
plot(mpgam_model_step)