
Course 4 of 10 in the [Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science) 

### [Exploratory Data Analysis:](https://www.coursera.org/learn/exploratory-data-analysis?specialization=jhu-data-science) 
Covers the essential exploratory techniques for summarizing data. These techniques are typically applied before formal modeling commences and can help inform the development of more complex statistical models. Exploratory techniques are also important for eliminating or sharpening potential hypotheses about the world that can be addressed by the data. Instructors also cover in detail the plotting systems in R as well as some of the basic principles of constructing data graphics as well as some of the common multivariate statistical techniques used to visualize high-dimensional data. The course is and complemented by [swirl demos](https://github.com/swirldev/swirl_courses/tree/master/Exploratory_Data_Analysis).

This course can be applied to multiple Specializations or Professional Certificates programs. Completing this course will count towards your learning in any of the following programs, the [Data Science Specialization](https://www.coursera.org/specializations/jhu-data-science) as well as the [Data Science: Foundations using R Specialization](https://www.coursera.org/specializations/data-science-foundations-r).

SKILLS YOU WILL GAIN: ` Cluster Analysis - Ggplot2 - R Programming - Exploratory Data Analysis `

There are three key plotting systems in R, the [Base](https://rpubs.com/lindangulopez/656288), which is a type of artist's palette, model,  a [Lattice System](http://rpubs.com/lindangulopez/661915), which allows to specify an entire plot specified by one function nd the Grammar	of	Graphics is the "third" graphics	system	for R and is available	from CRAN	via install.packages() 

### “In	brief,	the	grammar	tells	us	that	a	statstcal graphic	is	a	mapping	from	data	to	aesthetc attributes	(colour,	shape,	size)	of	geometric objects	(points,	lines,	bars).	The	plot	may	also contain	statstcal	transforma:ons	of	the	data and	is	drawn	on	a	specific	coordinate	system”  [ggplot2 book](https://ggplot2-book.org/)

ggplot2 was used to explore a mouse	allergen	and	asthma	cohort	study of children	(aged	5—17) with persistent	asthma, in the second week, data, up to 5 record per child, were collected over a year. [Extract of maacs data set](https://github.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/blob/master/datasets/maacs.rda?raw=true) to produced and style muplitple plot and other graphs, with:

![library(ggthemes)](https://github.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/blob/master/images/ggplot2_maacs_finalplot.png?raw=true)
![here's Prof.Roger Peng's Rcode](https://github.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/blob/master/images/ggplot2_maacs_finalplot_code.png?raw=true)

### [learn more about ggplot2 here, ...](https://rpubs.com/lindangulopez/662006)

 Also covered was:
 ## The Lattice Plotting System in R 
-xyplot: this is the main function for creating scatterplots
-bwplot: box-and-whiskers plots (“boxplots”)
-histogram: histograms
-stripplot: like a boxplot but with actual points
-dotplot: plot dots on "violin strings"
-splom: scatterplot matrix; like pairs in base plotting system
-levelplot, contourplot: for plotting "image" data
-[print to other graphic devices, like pdf](https://github.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/raw/master/Scripts/myplot.pdf)

### the lattice system is easy to use and you can quickly produce multiple graphs by splitting the factors with the ![library("gridExtra")](https://github.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/blob/master/images/latticeMPs.png?raw=true)

### [Learn more about the lattice plot system here, ...](https://rpubs.com/lindangulopez/661915) & [the base plot system here, ...](https://rpubs.com/lindangulopez/656288)

### [Base plotting on graphic devices](https://rpubs.com/lindangulopez/656565) was explored, in the [first week](https://github.com/lindangulopez/ExData_Plotting1/tree/master/figure) used data from the UC Irvine Machine Learning Repository, the “Individual household electric power consumption [Data Set](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)": Electric power consumption [20Mb]
Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available. The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
- https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
- Date: Date in format dd/mm/yyyy
- Time: time in format hh:mm:ss
- Global_active_power: household global minute-averaged active power (in kilowatt)
- Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
- Voltage: minute-averaged voltage (in volt)
- Global_intensity: household global minute-averaged current intensity (in ampere)
- Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
- Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
- Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
Source:

Georges Hebrail (georges.hebrail '@' edf.fr), Senior Researcher, EDF R&D, Clamart, France
Alice Berard, TELECOM ParisTech Master of Engineering Internship at EDF R&D, Clamart, France

To produce these [four PNG files and four R code files](https://github.com/lindangulopez/ExData_Plotting1).

### [function Plot.R](https://raw.githubusercontent.com/lindangulopez/ExData_Plotting1/master/plot1.R)


![Figure 1: download link](https://raw.githubusercontent.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/master/ExData_Plotting1/figure/plot1.png) 
https://raw.githubusercontent.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/master/ExData_Plotting1/figure/plot1.png


### [function Plot2.R](https://raw.githubusercontent.com/lindangulopez/ExData_Plotting1/master/plot2.R)

![Figure 2: download link](https://raw.githubusercontent.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/master/ExData_Plotting1/plot2.png) 


## [function Plot3.R](https://raw.githubusercontent.com/lindangulopez/ExData_Plotting1/master/plot3.R)

![Figure 3: download link](https://raw.githubusercontent.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/master/ExData_Plotting1/plot3.png) 


### [function Plot4.R](https://raw.githubusercontent.com/lindangulopez/ExData_Plotting1/master/plot4.R)

![Figure 4: download link](https://github.com/lindangulopez/Exploratory-Data-Analysis-by-Johns-Hopkins-University-on-COURSERA/blob/master/ExData_Plotting1/plot4.png?raw=true) 
