import React from "react"
import PropTypes from "prop-types"

import DataGrid, { SelectColumn } from 'react-data-grid';

const columns = [
  SelectColumn,
  { key: 'id', name: 'ID' },
  { key: 'name', name: 'Plant' },
  { key: 'family', name: 'Family' },
  { key: 'genus', name: 'Genus' }
];

let rows = [];

function rowGetter(row) {
  return row.id;
}

function PlantGridGenerator() {
  const [selectedRows, setSelectedRows] = React.useState(() => new Set());

  return (<DataGrid columns={columns} rows={rows} rowKeyGetter={rowGetter} onSelectedRowsChange={setSelectedRows} selectedRows={selectedRows}/>);
}

class PlantGrid extends React.Component {
  render () {
    let plants = JSON.parse(this.props.plants);
    rows = plants.map(x => ({ id: x.id, name: x.name, family: x.family, genus: x.genus }));

    return (<PlantGridGenerator/>);
  }
}

PlantGrid.propTypes = {
  plants: PropTypes.string
};
export default PlantGrid
