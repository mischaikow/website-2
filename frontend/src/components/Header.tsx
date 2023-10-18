import React from 'react'
import { NavLink } from 'react-router-dom'

const Header = () => {

    return (
        <div className="header">
            <NavLink 
                className={(navData) => (navData.isActive ? 'activeHeaderLink' : 'headerLink')}
                to="/home"
            >
                HOME
            </NavLink>
            <NavLink 
                className={(navData) => (navData.isActive ? 'activeHeaderLink' : 'headerLink')}
                to="/blog"
            >
                BLOG
            </NavLink>
        </div>
    )
}

export default Header;