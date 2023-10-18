import React from 'react'
import '../css/base.css'

const Footer = () => {
    const linkStyle = {
        color: "#202a25",
    }

    return (
        <div className="footer">
            <div className="container">
                <p>&copy; {new Date().getFullYear()} Chris Mischaikow, all rights reserved.</p>
                <p>Find the code powering this website <a href="https://github.com/mischaikow/website" style={linkStyle}>here</a>.</p>
            </div>
        </div>
    )
}

export default Footer;