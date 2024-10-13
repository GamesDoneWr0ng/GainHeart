# reduce seconds
execute as @a run scoreboard players remove @s timerSeconds 1
# reduce minutes
execute as @a if score @s timerSeconds matches ..0 run scoreboard players remove @s timerMinutes 1

# Display
execute as @a run title @s actionbar [{"color":"aqua","text":"Next Heart: "},{"score":{"name":"@s","objective":"timerMinutes"}},":",{"score":{"name":"@s","objective":"timerSeconds"}}," Multiplier: ",{"score":{"name":"@s","objective":"multiplier"}}]

# First join
execute as @a unless score @s lastKills matches -100000.. run scoreboard players set @s lastKills 0
execute as @a unless score @s lastDeaths matches -100000.. run scoreboard players set @s lastDeaths 0
execute as @a unless score @s timerSeconds matches -100000.. run scoreboard players set @s timerSeconds 0
execute as @a unless score @s timerMinutes matches -100000.. run scoreboard players set @s timerMinutes 30
execute as @a unless score @s multiplier matches -100000.. run scoreboard players set @s multiplier 10

# timer ran out
execute as @a if score @s timerMinutes matches ..0 if score @s timerSeconds matches ..0 run scoreboard players operation @s hearts += @s multiplier
execute as @a if score @s timerMinutes matches ..0 if score @s timerSeconds matches ..0 run function gainheart:update_health

# Death check
execute as @a if score @s deaths = @s lastDeaths if score @s multiplier matches ..0 run say "Reset multiplier"
execute as @a if score @s deaths = @s lastDeaths if score @s multiplier matches ..0 run scoreboard players set @s multiplier 10
execute as @a if score @s deaths > @s lastDeaths run scoreboard players remove @s multiplier 5
execute as @a if score @s deaths > @s lastDeaths if score @s multiplier matches ..4 run scoreboard players add @s multiplier 4
execute as @a if score @s multiplier matches ..0 run say "Set LastDeath"
execute as @a if score @s multiplier matches ..0 store result score @s lastDeaths run scoreboard players get @s deaths
execute as @a if score @s multiplier matches ..0 run ban @s[type=player] "Multiplier to low!"
execute as @a if score @s deaths > @s lastDeaths run scoreboard players set @s hearts 0
execute as @a if score @s deaths > @s lastDeaths run attribute @s generic.max_health modifier remove gainheart
execute as @a if score @s deaths > @s lastDeaths store result score @s lastDeaths run scoreboard players get @s deaths

# Check kill
execute as @a if score @s kills > @s lastKills run scoreboard players add @s multiplier 5
execute as @a if score @s kills > @s lastKills if score @s multiplier matches 50.. run scoreboard players set @s multiplier 50
execute as @a if score @s kills > @s lastKills store result score @s lastKills run scoreboard players get @s kills

# reset timer
execute as @a if score @s timerMinutes matches ..0 if score @s timerSeconds matches ..0 run scoreboard players set @s timerMinutes 29
execute as @a if score @s timerSeconds matches ..0 run scoreboard players set @s timerSeconds 59