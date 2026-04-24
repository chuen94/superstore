select
    "Regional Manager" as regional_manager,
    "Region" as region
from {{ source('raw_data', 'PEOPLE_RAW') }}
