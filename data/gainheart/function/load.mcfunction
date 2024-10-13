tellraw @a {"text": "Datapack has loaded!", "color": "yellow"}

kill @e[type=armor_stand, x=0,y=0,z=0]
summon armor_stand 0 0 0 {UUID:[I;0,0,0,0],NoGravity:1b,Silent:1b,Invulnerable:1b, Invisible:1b} 

scoreboard objectives add timer dummy
scoreboard objectives add timerSeconds dummy
scoreboard objectives add timerMinutes dummy "HeartTimers"
scoreboard objectives add hearts dummy "Bonus Hearts"
scoreboard objectives add multiplier dummy "Multipliers"
scoreboard objectives setdisplay list hearts

scoreboard objectives add deaths deathCount "Deaths"
scoreboard objectives add kills minecraft.killed:minecraft.player "Player Kills"
scoreboard objectives add lastDeaths dummy
scoreboard objectives add lastKills dummy

data modify storage gainhearts zero set value 0