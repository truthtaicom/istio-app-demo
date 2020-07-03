import React, { useEffect, useState } from 'react';
import axios from 'axios'
import './App.css';

interface IProduct {
  name: string
}

function App() {
  const [products, setProducts] = useState<IProduct[]>([])

  useEffect(() => {
    getProducts()
  }, [])

  const getProducts = async () => {
    const resp = await axios.get("http://localhost/products")

    setProducts(resp.data.data)
  }

  return (
    <div className="App">
      {
        products.map(elm => (
          <div>
            <p>{elm.name}</p>
          </div>
        ))
      }
    </div>
  );
}

export default App;
