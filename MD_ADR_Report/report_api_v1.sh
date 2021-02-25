#!/bin/bash

utc_tdate=$(date -u +"%Y-%m-%dT%H:%M:%SZ)
utc_ydate=$(date --date="yesterday" -u +"%Y-%m-%dT%H:%M:%SZ")
api_traxis=http://192.168.56.21/traxis/web
output_folder=/opt/MD_Reports/output

curl --location --request POST '$api_traxis' \
--header 'Content-Type: application/xml' \
--data-raw '<?xml version="1.0" encoding="utf-8"?>
<Request xmlns="urn:eventis:traxisweb:1.0">
    <ResourcesQuery resourceType="channel">
		<ResourceIds>
			<ResourceId aliasType="IngestedServiceId">441679617</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1907509880</ResourceId>
			<ResourceId aliasType="IngestedServiceId">5578354365</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1419842892</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1420021070</ResourceId>
			<ResourceId aliasType="IngestedServiceId">4841233446</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1725412410</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1419817466</ResourceId>
			<ResourceId aliasType="IngestedServiceId">3272245449</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1612351388</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1270959130</ResourceId>
			<ResourceId aliasType="IngestedServiceId">4958461558</ResourceId>
			<ResourceId aliasType="IngestedServiceId">4505658347</ResourceId>
			<ResourceId aliasType="IngestedServiceId">3622046778</ResourceId>
			<ResourceId aliasType="IngestedServiceId">6339169506</ResourceId>
			<ResourceId aliasType="IngestedServiceId">952820506</ResourceId>
			<ResourceId aliasType="IngestedServiceId">958936465</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1895270707</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1506873534</ResourceId>
			<ResourceId aliasType="IngestedServiceId">3930373124</ResourceId>
			<ResourceId aliasType="IngestedServiceId">4824617557</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1462684619</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1867694518</ResourceId>
			<ResourceId aliasType="IngestedServiceId">69031329</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1489286137</ResourceId>
			<ResourceId aliasType="IngestedServiceId">69039829</ResourceId>
			<ResourceId aliasType="IngestedServiceId">1718589149</ResourceId>
			<ResourceId aliasType="IngestedServiceId">69039140</ResourceId>
			<ResourceId aliasType="IngestedServiceId">288432945</ResourceId>
			<ResourceId aliasType="IngestedServiceId">69021344</ResourceId>
		</ResourceIds>
		<Options>
			<Option type="props">events</Option>
		</Options>
	<SubQueries>
      <SubQuery relationName="events">
        <Options>
          <Option type="filter">HasTstv==true&amp;&amp;AvailabilityStart&gt;=$utc_tdate&amp;&amp;AvailabilityEnd&lt;=$utc_ydate</Option>
          <Option type="props">availabilitystart</Option>
          <Option type="sort">availabilitystart</Option>
        </Options>
			<SubQueries>
				<SubQuery relationName="TstvContents">
					<Options>
						<Option type="props">Tstv,EncodingProfile</Option>
					</Options>
					<SubQueries>
						<SubQuery relationName="Titles">
							<Options>
								<Option type="props">Name</Option>
							</Options>
						</SubQuery>
					</SubQueries>
				</SubQuery>
			</SubQueries>
        </SubQuery>
      </SubQueries>
   </ResourcesQuery>
 </Request>'
--output $output_folder/reporteMD.xml




 