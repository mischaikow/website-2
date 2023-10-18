import React from 'react';
import './css/normalize.css';
import './css/base.css';
import Header from './components/Header'
import Content from './components/Content'
import Footer from './components/Footer'

const App = () => {
  return (
    <>
      <Header />
      <Content />
      <Footer />
    </>
  );
}

export default App;
