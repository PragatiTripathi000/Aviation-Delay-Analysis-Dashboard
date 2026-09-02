let
    // 1. Load source data
    Source = Csv.Document(File.Contents("path_to_source\Airline_Delay_Cause.csv"), [Delimiter=",", Columns=21, Encoding=1252, QuoteStyle=QuoteStyle.None]),

    // 2. Promote first row to headers
    #"Use First Row as Headers" = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),

    // 3. Cast appropriate data types across all columns
    #"Change Type" = Table.TransformColumnTypes(#"Use First Row as Headers", {
        {"year", Int64.Type}, 
        {"month", Int64.Type}, 
        {"carrier", type text}, 
        {"carrier_name", type text}, 
        {"airport", type text}, 
        {"airport_name", type text}, 
        {"arr_flights", Int64.Type}, 
        {"arr_del15", Int64.Type}, 
        {"carrier_ct", type number}, 
        {"weather_ct", type number}, 
        {"nas_ct", type number}, 
        {"security_ct", type number}, 
        {"late_aircraft_ct", type number}, 
        {"arr_cancelled", Int64.Type}, 
        {"arr_diverted", Int64.Type}, 
        {"arr_delay", Int64.Type}, 
        {"carrier_delay", Int64.Type}, 
        {"weather_delay", Int64.Type}, 
        {"nas_delay", Int64.Type}, 
        {"security_delay", Int64.Type}, 
        {"late_aircraft_delay", Int64.Type}
    }),

    // 4. Rename technical column names to user-friendly business labels
    #"Renamed Columns" = Table.RenameColumns(#"Change Type", {
        {"arr_flights", "Total Flights"}, 
        {"arr_del15", "Delayed Flights"}, 
        {"arr_cancelled", "Cancelled Flights"}, 
        {"carrier_ct", "Carrier Delay Count"}, 
        {"weather_ct", "Weather Delay Count"}, 
        {"nas_ct", "NAS Delay Count"}, 
        {"security_ct", "Security Delay Count"}, 
        {"late_aircraft_ct", "Late Aircraft Count"}, 
        {"arr_delay", "Total Delay Minutes"}, 
        {"carrier_delay", "Carrier Delay (Mins)"}, 
        {"weather_delay", "Weather Delay (Mins)"}, 
        {"carrier_name", "Airline"}, 
        {"airport_name", "Airport Location"}
    }),

    // 5. Create synthetic monthly date key from year and month
    #"Added Custom" = Table.AddColumn(#"Renamed Columns", "Flight Date", each #date([year], [month], 1)),

    // 6. Explicitly set data type for Flight Date
    #"Changed Type" = Table.TransformColumnTypes(#"Added Custom", {{"Flight Date", type date}}),

    // 7. Split compound Airport Location text into City and Airport Detail
    #"Split Column by Delimiter" = Table.SplitColumn(#"Changed Type", "Airport Location", Splitter.SplitTextByDelimiter(":", QuoteStyle.Csv), {"Airport Location.1", "Airport Location.2"}),

    // 8. Type split text fields
    #"Changed Type1" = Table.TransformColumnTypes(#"Split Column by Delimiter", {{"Airport Location.1", type text}, {"Airport Location.2", type text}}),

    // 9. Rename split output columns
    #"Renamed Columns1" = Table.RenameColumns(#"Changed Type1", {{"Airport Location.1", "City"}, {"Airport Location.2", "Airport Detail"}}),

    // 10. Audit filter step retaining all rows
    #"Filtered Rows" = Table.SelectRows(#"Renamed Columns1", each true),

    // 11. Append ", USA" to city name for clean map geocoding
    #"Added Custom1" = Table.AddColumn(#"Filtered Rows", "City_USA", each [City] & ", USA")
in
    #"Added Custom1"
