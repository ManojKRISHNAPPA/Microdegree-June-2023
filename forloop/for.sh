#!/bin/bash 
for a in data*
do
	tar -cvzf $a.tar $a

done

