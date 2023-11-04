use context essentials2021

include gdrive-sheets
include data-source

include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")


ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data = load-table:
  komponent, energi
  source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
  sanitize energi using string-sanitizer
end

kWh-wealthy-consumer-data

fun bil-energi(distance-travelled-per-day :: Number, distance-per-unit-of-fuel :: Number) -> Number:
  energy-per-unit-of-fuel = 10 # 10kWh per liter
  (distance-travelled-per-day / distance-per-unit-of-fuel) * energy-per-unit-of-fuel
end

bil-energi(30, 18.1)

fun energi-to-number(str :: String) -> Number:
# skriv koden her (tips: bruk cases og string-to-number funksjonen)
  energiforbruk = string-to-number(str)
  cases (Option) energiforbruk:
    | none => bil-energi(30, 18.1)
    | some(num) => num
  end
where:
  energi-to-number("") is 0
  energi-to-number("abcdefg") is 0
  energi-to-number("48") is 48
end


transformed-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)
transformed-table

sum-energi = sum(transformed-table, "energi") 

bar-chart(transformed-table, "komponent", "energi")