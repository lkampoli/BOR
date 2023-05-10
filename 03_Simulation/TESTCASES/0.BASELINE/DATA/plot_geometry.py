#pylab inline
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
img = mpimg.imread('geometry.png')
imgplot = plt.imshow(img)

#plt.axvline(x=0.22058956)

# only one line may be specified; full height
#plt.axvline(x=36, color='b', label='axvline - full height')

#xs = np.linspace(1, 21, 200)

#plt.figure(figsize=(10, 7))

# only one line may be specified; full height
#plt.axvline(x=36, color='b', label='axvline - full height')

# only one line may be specified; ymin & ymax specified as a percentage of y-range
#plt.axvline(x=36.25, ymin=0.05, ymax=0.95, color='b', label='axvline - % of full height')

# multiple lines all full height
#plt.vlines(x=[37, 37.25, 37.5], ymin=0, ymax=len(xs), colors='purple', ls='--', lw=2, label='vline_multiple - full height')

# multiple lines with varying ymin and ymax
#plt.vlines(x=[38, 38.25, 38.5], ymin=[0, 25, 75], ymax=[200, 175, 150], colors='teal', ls='--', lw=2, label='vline_multiple - partial height')

# single vline with full ymin and ymax
#plt.vlines(x=39, ymin=0, ymax=len(xs), colors='green', ls=':', lw=2, label='vline_single - full height')

# single vline with specific ymin and ymax
#plt.vlines(x=39.25, ymin=25, ymax=150, colors='green', ls=':', lw=2, label='vline_single - partial height')

# place the legend outside
plt.legend(bbox_to_anchor=(1.0, 1), loc='upper left')

xcoords = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950]
for xc in xcoords:
    plt.axvline(x=xc, ymin=0, ymax=150, color='red', ls='--')

plt.xlabel('') 
plt.ylabel('')

plt.xticks([])
plt.yticks([])

plt.show()
