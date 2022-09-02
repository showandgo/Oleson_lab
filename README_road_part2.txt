HNL Roads

After running Python code for spatial joins- average speeds for roads calculated on DOT road dataset, then joined to State GIS Portal Road network dataset for Honolulu County.

Remaining null average speeds imputed with mean of similar road (Street Classification Code) average speeds, 
If no average speeds are available for particular Street Classification Code, then approximate average speeds manually imputed from Google Maps. 

The Street Classification Code are assigned the following speeds if no average speeds were calculated from DOT rad dataset- 

Street Class    |    Average Speed (default)
1: Other Road   |    10mph
2: Freeway      |    52mph
3: County Arterial | 5mph
4: City Street  |    29mph
5: Jeep Trail   |    8mph
6: Access Ramp  |    37mph
7: Highway Service Road | 12mph
8: Highway      |    36mph
12: Driveway or Service Road | 5mph


Encode "oneway" on Excel 
0 (two way) -> N
1 (one-way in direction drawn) -> FT
2 (one-way but in opp dir drawn) -> TF



VBA pre-logic Scipt Code for "Oneway"; From To

restricted = False
Select Case UCase([oneway])
  Case "2" : restricted = True
End Select

VBA pre-logic Scipt Code for "Oneway"; To From

restricted = False
Select Case UCase([oneway])
  Case "1" : restricted = True
End Select


VBA Scipt Code for "Minutes"
([st_lengths] * 0.000621371)/([avg_spd]) * 60
    