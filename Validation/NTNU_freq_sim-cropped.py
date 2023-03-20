# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

# Import plotly express
import plotly.io as pio
#import plotly.express as px
from plotly.subplots import make_subplots
import plotly.graph_objects as go
import pandas as pd
pio.renderers.default='svg'


data = pd.read_csv("exportedVariables.csv")

fig = make_subplots(
    rows=2, cols=1,
    x_title='Time(s)',
    shared_xaxes=True,
    vertical_spacing=0.05)


fig.append_trace(go.Scatter(
    x=data.time,
    y=data.freq,
    name='Grid Frequency',
), row=1, col=1,)

fig.append_trace(go.Scatter(
    x=data.time,
    y=data.freqLim,
    name='Frequency Limit'
), row=1, col=1)

fig.update_yaxes(title_text="Frequency (Hz)", dtick=0.1, row=1, col=1)

fig.append_trace(go.Scatter(
    x=data.time,
    y=data.PVGTLoss,
    name='PV + GT Loss'
), row=2, col=1)


fig.append_trace(go.Scatter(
    x=data.time,
    y=data.Batt,
    name = 'Battery'
), row=2, col=1)

fig.append_trace(go.Scatter(
    x=data.time,
    y=data.GTs,
    name='GTs'
), row=2, col=1)

fig.update_yaxes(title_text="Power (W)", dtick=10000000, row=2, col=1)


for ax in fig['layout']:
    if ax[:5]=='xaxis':
        fig['layout'][ax]['dtick']=10


fig.update_layout(
    template='simple_white',
    legend=dict(
        orientation='h',
        y=1.1),
#    height=600,
#    width=1000
    )


fig.show()