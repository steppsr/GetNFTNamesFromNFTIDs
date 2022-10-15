#!/bin/bash

# Script will read in a file with NFT IDs, and output the NFT ID and the NFT Name to the screen.
# Use redirect to send to a file.
#
# Example:
#   bash getnftnames.sh nftids.txt > my_output.txt

nft_ids=`cat ./$1`
for id in $nft_ids; do
  nft_json=`curl -s https://api.mintgarden.io/nfts/$id`
  nft_id=`echo "$nft_json" | jq '.encoded_id' | cut -c 2- | rev | cut -c 2- | rev`
  nft_name=`echo "$nft_json" | jq '.data.metadata_json.name' | cut -c 2- | rev | cut -c 2- | rev`
  echo "$nft_id,$nft_name"
done

