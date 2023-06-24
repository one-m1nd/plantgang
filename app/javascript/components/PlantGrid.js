import React from "react"
import PropTypes from "prop-types"

import DataGrid from 'react-data-grid';

const columns = [
  { key: 'id', name: 'ID' },
  { key: 'name', name: 'Plant' }
];


class PlantGrid extends React.Component {
  render () {
    var plants = JSON.parse(this.props.plants);
    var rows = plants.map(x => ({id: x.id, name: x.name}));

    return (
        <DataGrid columns={columns} rows={rows} />
    );
  }
}

PlantGrid.propTypes = {
  plants: PropTypes.string
};
export default PlantGrid
