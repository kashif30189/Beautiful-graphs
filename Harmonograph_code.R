# This is a sample code for a harmonograph.This essentially means there are 2 pendulums 
# which are moving in conjugation with each other

# First harmonographs were built in 1857 by Scottish mathematician Hugh Blackburn, 
# based on the previous work of French mathematician Jean Antoine Lissajous. 
# There is not an unique way to describe mathematically the motion of the pencil. 
# I have implemented the one I found in this sensational blog, where motion in both
# x and y axis depending on time is defined by:

# x(t) = exp(-d1*t)* sin(f1t + p1) + exp(-d2*t)*sin(f2t + p2)
# y(t) = exp(-d3*t)* sin(f3t + p3) + exp(-d4*t)*sin(f4t + p4)

library(ggplot2)
sample(c(2,3),1))
f1=jitter(sample(c(2,3),1))
f2=jitter(sample(c(2,3),1))
f3=jitter(sample(c(2,3),1))
f4=jitter(sample(c(2,3),1))
d1=runif(1,0,1e-02)
d2=runif(1,0,1e-02)
d3=runif(1,0,1e-02)
d4=runif(1,0,1e-02)
p1=runif(1,0,pi)
p2=runif(1,0,pi)
p3=runif(1,0,pi)
p4=runif(1,0,pi)
xt = function(t) exp(-d1*t)*sin(t*f1+p1)+exp(-d2*t)*sin(t*f2+p2)
yt = function(t) exp(-d3*t)*sin(t*f3+p3)+exp(-d4*t)*sin(t*f4+p4)
t=seq(1, 100, by=.001)
dat=data.frame(t=t, x=xt(t), y=yt(t))
ggplot(dat,aes(xt(t),yt(t))) + geom_path() + ggtitle("Harmonograph") + 
  theme_classic() + theme(axis.line = element_blank(),axis.title = element_blank(),
                            axis.ticks = element_blank() )




with(dat, plot(x,y, type="l", xlim =c(-2,2), ylim =c(-2,2), xlab = "", ylab = "", xaxt='n', yaxt='n'))
