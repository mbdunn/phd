"""A collection of Python functions to do routine tasks associated with
plotting and visualization of sailbuoy data.
"""

import numpy as np
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import cartopy.feature as cfeature

    
land_50m = cfeature.NaturalEarthFeature('physical', 'land', '50m',
                                        edgecolor='black',
                                        facecolor=cfeature.COLORS['land'])
ocean_50m = cfeature.NaturalEarthFeature('physical', 'ocean', '50m',edgecolor='face',facecolor=cfeature.COLORS['water'])
tromsø_lon = 18.9553
tromsø_lat = 69.6492

def plot_tromsoflaket(
    axes, 
    extent=[15.80, 20, 67, 72.20]):
    """plot the coastline contour of Tromsøflaket with Tromsø sentrum indicated
    :arg axes Axes instance to plot the coastline on.
    :type axes 'matplotlib.axes.Axes'
    
    :arg extent extent of the map [lon_min, lon_max, lat_min, lat_max]. Default to cover Tromsøflaket region.
    :type extent numpy.ndarray
    """
    land_50m = cfeature.NaturalEarthFeature('physical', 'land', '50m',
                                        edgecolor='black',
                                        facecolor=cfeature.COLORS['land'])
    ocean_50m = cfeature.NaturalEarthFeature('physical', 'ocean', '50m',
                                        edgecolor='face',
                                        facecolor=cfeature.COLORS['water'])
    # create map
    pcar = ccrs.PlateCarree()
    ax = plt.subplot(1,1,1,projection=ccrs.PlateCarree())
    ax.gridlines(draw_labels=True)
    ax.set_extent(extent, crs=pcar)

    ax.coastlines(resolution='50m')
    
    ax.add_feature(ocean_50m)
    ax.add_feature(land_50m)
    
    plt.plot(tromsø_lon, tromsø_lat, 'r*',transform=ccrs.Geodetic(), markersize=14)
    plt.text(tromsø_lon-0.15, tromsø_lat-0.15, 'Tromsø', transform=ccrs.Geodetic(), fontsize=16)
    
    return

