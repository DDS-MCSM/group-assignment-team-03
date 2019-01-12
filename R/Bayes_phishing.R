library(caret)
library(caTools)
library(e1071)
library(ElemStatLearn)

any(is.na(mixed_links))

mixed_links$index <- factor(mixed_links$index, levels = c(0, 1))
typeof(mixed_links$index)

mixed_links_defined <- mixed_links[,c(2,3,4,5,7,8,9)]
head(mixed_links_defined)

head(mixed_links)

set.seed(123)
split = sample.split(mixed_links_defined$index, SplitRatio = 0.70)
training_set = subset(mixed_links_defined, split == TRUE)
test_set = subset(mixed_links_defined, split == FALSE)

head(training_set)

pca = preProcess(x = training_set[-8], method = 'pca', pcaComp = 2)
training_set_pca = predict(pca, training_set)
training_set_pca = training_set_pca[c(2, 3, 1)]
test_set_pca = predict(pca, test_set)
test_set_pca = test_set_pca[c(2, 3, 1)]
head(test_set_pca)

classifier = naiveBayes(x = training_set_pca[-3], y = training_set_pca$index)

y_pred = predict(classifier, newdata = test_set_pca[-3])

confusionMatrix(table(test_set_pca[, 3], y_pred))

set = test_set_pca

X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('PC1', 'PC2')

y_grid = predict(classifier, newdata = grid_set)

plot(set[, -3], main = 'Naive Bayes',
     xlab = 'PC1', ylab = 'PC2',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'tomato', 'springgreen3'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'red3','green4'))

