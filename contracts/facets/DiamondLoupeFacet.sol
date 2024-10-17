// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../interfaces/IDiamondLoupe.sol";
import "../libraries/LibDiamond.sol";

contract DiamondLoupeFacet is IDiamondLoupe {
    function facets() external view override returns (Facet[] memory facets_) {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        uint256 numFacets = ds.facetAddresses.length;
        facets_ = new Facet[](numFacets);
        for (uint256 i; i < numFacets; i++) {
            address facetAddress = ds.facetAddresses[i];
            facets_[i].facetAddress = facetAddress;
            facets_[i].functionSelectors = ds.facetFunctionSelectors[facetAddress].functionSelectors;
        }
    }

    function facetFunctionSelectors(address _facet) external view override returns (bytes4[] memory) {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.facetFunctionSelectors[_facet].functionSelectors;
    }

    function facetAddresses() external view override returns (address[] memory) {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.facetAddresses;
    }

    function facetAddress(bytes4 _functionSelector) external view override returns (address) {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.selectorToFacetAndPosition[_functionSelector].facetAddress;
    }
}